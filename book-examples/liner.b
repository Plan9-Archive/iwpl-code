#
#       Software from the book "Inferno Programming with Limbo"
#       published by John Wiley & Sons, January 2003.
#
#       p. Stanley-Marbell <pip@gemusehaken.org>
#
implement Liner;

include "sys.m";
include "draw.m";
include "bufio.m";

sys : Sys;
bufio : Bufio;
Iobuf : import bufio;
                
Liner : module
{
	init : fn(ctxt : ref Draw->Context, argv : list of string);
};

init (nil : ref Draw->Context, argv : list of string)
{
	param := tl argv;
	while (param != nil)
	{
		liner(hd param);

		param = tl param;
	}
}

liner(filename : string)
{
	lines : list of string;
	temp_line : string;

	sys = load Sys Sys->PATH;
	bufio = load Bufio Bufio->PATH;
             
	file_buf := bufio->open(filename,sys->ORDWR);
	while ()
	{
		temp_line = file_buf.gets('\n');
		if (temp_line == "")
			break;
		else
			lines = temp_line::lines; 
	}

	file_buf.seek(0,0);
	lines = reorder(lines);
                
	i := 1;
	while (lines != nil)
	{
		file_buf.puts(string i +"\t"+ hd lines);
		lines = tl lines;
		i++;
	}

	file_buf.flush();
}
                
reorder(flist : list of string) : list of string
{
	rlist : list of string;
                
	while (flist != nil)
	{
		rlist = hd flist::rlist;
		flist = tl flist;
	}
                
	return rlist;
}
