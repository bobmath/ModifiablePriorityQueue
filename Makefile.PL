use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Array::Heap::ModifiablePriorityQueue',
    VERSION_FROM => 'lib/Array/Heap/ModifiablePriorityQueue.pm', # finds \$VERSION
    AUTHOR       => 'Bob Mathews (bobmathews@alumni.calpoly.edu)',
    ABSTRACT     => 'Modifiable priority queue using Array::Heap',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                     'Array::Heap' => 3.0,
                    },
);
