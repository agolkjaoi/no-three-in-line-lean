"""Check PDF text/metadata/page bounds and make contact sheets of rendered pages.

Render first with pdftoppm -r 85 -png ... tmp/pdfs/page.
Visual inspection is a separate required step; this script does not claim it.
"""
from pathlib import Path
import argparse
import hashlib
import json
import re
import pdfplumber
from pypdf import PdfReader
from PIL import Image, ImageOps, ImageDraw

def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--allow-pending', action='store_true')
    args = parser.parse_args()
    root = Path(__file__).resolve().parent.parent
    pdf = root/'output/pdf/no_three_in_line_481_en.pdf'
    raw = pdf.read_bytes()
    reader = PdfReader(pdf)
    text = '\n'.join(p.extract_text() or '' for p in reader.pages)
    pending = 'still pending' in text or 'Working-copy execution status' in text
    if pending and not args.allow_pending:
        raise AssertionError('Pending replay marker in final PDF')
    if '\ufffd' in text or re.search(r'(?<!\?)\?\?(?!\?)', text):
        raise AssertionError('Replacement character or unresolved reference in PDF')
    if (reader.metadata or {}).get('/Author') not in (None, ''):
        raise AssertionError('Unexpected named author metadata')
    outside = []
    with pdfplumber.open(pdf) as doc:
        for number, page in enumerate(doc.pages,1):
            for char in page.chars:
                if char['x0'] < -1 or char['x1'] > page.width+1 or char['top'] < -1 or char['bottom'] > page.height+1:
                    outside.append({'page':number,'text':char['text'],'bbox':[char['x0'],char['top'],char['x1'],char['bottom']]})
    if outside:
        raise AssertionError('Characters outside page bounds: '+str(outside[:5]))
    log = (root/'output/pdf/no_three_in_line_481_en.log').read_text(errors='replace')
    badlog = [line for line in log.splitlines() if re.search(r'Overfull|Undefined control|undefined references|Reference .* undefined|Missing character|multiply defined',line)]
    if badlog:
        raise AssertionError('LaTeX diagnostics: '+str(badlog))
    tmp = root/'tmp/pdfs'
    (tmp/'extracted.txt').write_text(text, encoding='utf-8')
    pngs = sorted(tmp.glob('page-*.png'))
    if len(pngs) != len(reader.pages):
        raise AssertionError('Rendered page count mismatch')
    for start in range(0,len(pngs),9):
        canvas = Image.new('RGB',(1260,1845),'#dedede')
        draw = ImageDraw.Draw(canvas)
        for i,path in enumerate(pngs[start:start+9]):
            page_img = Image.open(path).convert('RGB')
            page_img.thumbnail((400,565))
            x = (i%3)*420+10
            y = (i//3)*615+28
            canvas.paste(page_img,(x,y))
            draw.text((x,y-19),f'Page {start+i+1}',fill='black')
        canvas.save(tmp/f'contact-{start//9+1}.png')
    result = {
        'pdf':'output/pdf/no_three_in_line_481_en.pdf',
        'sha256':hashlib.sha256(raw).hexdigest(),
        'pages':len(reader.pages), 'bytes':len(raw),
        'metadata_author_empty':True, 'characters_outside_page':outside,
        'unresolved_references':False, 'latex_errors_or_overfull_boxes':badlog,
        'pending_execution_status':pending,
        'visual_inspection':'Separate manual image review required; not certified by this script.',
    }
    (root/'evidence/pdf_qa.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))

if __name__ == '__main__':
    main()
