# #!/usr/bin/perl
# use warnings;
# use strict;

# my $filename = 'test.txt';
# my $newfile  = "$filename.new";

# open my $IN, '<', $filename or die $!;
# open my $OUT, '>', $newfile or die $!;
# while (<$IN>) {
#     s/    path: ..\/worldview_messaging_kit/    # path: ..\/worldview_messaging_kit/;
#     s/    ref: develop/    # ref: develop/;
#     print {$OUT} $_;
# }
# close $OUT or die $!;
# rename $newfile, $filename or die $!;


#!/usr/bin/perl
use warnings;
use strict;

my $branch = system("git", "rev-parse", "--abbrev-ref", "HEAD");

my $filename = 'test.txt';
my $newfile  = "$filename.new";

open my $IN, '<', $filename or die $!;
open my $OUT, '>', $newfile or die $!;
while (<$IN>) {
    s/    path: ..\/worldview_messaging_kit/    # path: ..\/worldview_messaging_kit/;
    s/    # ref: develop/    ref: develop/;
    s/      # url: worldviewltd\@vs-ssh.visualstudio.com:v3\/worldviewltd\/Mobile\/worldview_messaging_kit/      url: worldviewltd\@vs-ssh.visualstudio.com:v3\/worldviewltd\/Mobile\/worldview_messaging_kit/;
    print {$OUT} $_;
}
close $OUT or die $!;
rename $newfile, $filename or die $!;

printf $branch;