use LaTeXML::Core;
use LaTeXML::Package;

LaTeXML::Core->new(searchpaths=>['./'])->withState(sub{ $_[0]->getModel->setRelaxNGSchema("omdoc+ltxml",
'#default'=>"http://omdoc.org/ns",
        'om'=>"http://www.openmath.org/OpenMath",
        'm'=>"http://www.w3.org/1998/Math/MathML",
        'xhtml'=>"http://www.w3.org/1999/xhtml",
        'dc'=>"http://purl.org/dc/elements/1.1/",
        'cc'=>"http://creativecommons.org/ns",
        'stex'=>"http://kwarc.info/ns/sTeX",
        'svg'=>"http://www.w3.org/2000/svg",
        'ltx'=>"http://dlmf.nist.gov/LaTeXML");
	RegisterNamespace('omdoc'=>"http://omdoc.org/ns");
	RegisterNamespace('om'=>"http://www.openmath.org/OpenMath");
	RegisterNamespace('m'=>"http://www.w3.org/1998/Math/MathML");
        RegisterNamespace('xhtml'=>"http://www.w3.org/1999/xhtml");
	RegisterNamespace('dc'=>"http://purl.org/dc/elements/1.1/");
	RegisterNamespace('cc'=>"http://creativecommons.org/ns");
	RegisterNamespace('stex'=>"http://kwarc.info/ns/sTeX");
	RegisterNamespace('ltx'=>"http://dlmf.nist.gov/LaTeXML");
	RegisterNamespace('svg'=>"http://www.w3.org/2000/svg");

	open MODEL, ">", "omdoc+ltxml.model";
	 *STDOUT = *MODEL;
	 $_[0]->getModel->compileSchema; 
	 close MODEL;
 });
