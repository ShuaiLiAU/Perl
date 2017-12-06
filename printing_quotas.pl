#!/usr/bin/perl


if($ARGV[0] eq "-a")
{
	if($ARGV[1])
	{
		print "Printing users : \n";
		showName(@ARGV);		
	}
	else
	{
		print "No printing users\n";
	}
}
elsif($ARGV[0] eq "-f")
{
	if($ARGV[1])
	{
		print"Total number of file printed : ". numPrint(@ARGV)."\n";
	}
	else
	{
		print "No files printed\n";
	}
}
elsif($ARGV[0] eq "-u")
{
	@c=nameAnum(@ARGV);
	nameAnum(@ARGV);
	if($c[0]>0)
	{
		print"User ".$ARGV[1].":\n";
		print"Total number of files printed:".$c[1]."\n";
		print"Total number of pages printed:".$c[0]."\n";		
	}	
	else
	{
		print"User ".$ARGV[1]." not found\n";
	}
}
elsif($ARGV[0] eq "-q")
{
	@b=numPage(@ARGV);
	if(@b>0)
	{
		print "Users above quota:\n";
		foreach $u (@b)
		{
			print "$u\n";
		}		
	}
	else
	{
		print "No user above quota\n";
	}
}
elsif($ARGV[0] eq "-v")
{
	print "Name      : Shuai   \n";
	print "Surname   : Li      \n";
	print "Student ID: 12497828\n";
}
else
{
	print"Invalid command syntax\n";
}
########################################################################

sub nameAnum
{
	my $newPageNum = 0;
	my $numFile=0;
	my @array=();
	my %newHash=();
	my $aa=0;
	my $bb=0;
	my $cc=0;
	open(INFILE,$_[2])||die "this file cannot be found :***$!***\n";
	while($_=<INFILE>)
	{
		if($_=~ m /$_[1]/)
		{
			$numFile++;
		}
		($aa,$bb,$cc)=split (/,/, $_);		
		if(exists $newHash{$cc})
		{
			$newHash{$cc}=$newHash{$cc}+$bb;
			
		}
		else
		{
			$newHash{$cc}=$bb;
		}		
	}
	while ((my $key, my $value)=each %newHash)
	{
		chomp($key);
		if($key eq $_[1])
		{
			$newPageNum=$value;
		}
	}
	$array[0]=$newPageNum;
	$array[1]=$numFile;
	return @array;
}

sub numPage
{
	my $a=0;
	my $subjects1=0;
	my $page1=0;
	my $name1=0;
	open(INFILE,$_[2])||die "this file cannot be found :***$!***\n";
	while($_=<INFILE>)
	{
		chomp;
		($subjects1,$page1,$name1)=split (/,/, $_);
		if(exists $new{$name1})
		{
			$new{$name1}=$new{$name1}+$page1;
		}		
		else
		{
			$new{$name1}=$page1;
		}
	}
	foreach $name2 (keys %new)
	{
		chomp($name2);
		if($new{$name2}>$_[1])
		{
			$new1[$a]=$name2;
			$a++;
		}
	}
	return @new1;		
}

sub numPrint
{
	$i=0;
	open(INFILE,$_[1])||die "this file cannot be found :***$!***\n";
	while(<INFILE>)
	{
		$i++;
	}
	return $i;	
}

sub showName
{
	open(INFILE, $_[1])||die "this file cannot be found :***$!***\n";
	while($_=<INFILE>)
	{	
		my $subjects=0;
		my $page=0;
		my $name=0;
		chomp($_);
		($subjects,$page,$name)=split ((/,/), $_);		
		if(exists $hash{$name})
		{
		}
		else
		{
			$hash{$name}=1;
			print $name."\n";
		}	
	}	
}
