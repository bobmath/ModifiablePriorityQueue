# -*- perl -*-

# t/mpq.t - check module loading and basic operation

use Test::More tests => 18;

BEGIN { use_ok( 'Array::Heap::ModifiablePriorityQueue' ); }

my $pq = Array::Heap::ModifiablePriorityQueue->new();
isa_ok($pq, 'Array::Heap::ModifiablePriorityQueue');

is($pq->size(), 0, 'initially empty');
$pq->add('a', 1);
$pq->add('b', 2);
is($pq->size(), 2, 'add');
is($pq->peek(), 'a', 'peek');
$pq->add('b', 0);
is($pq->size(), 2, 'modify');
is($pq->get(), 'b', 'get modified');
is($pq->size(), 1, 'size');
$pq->remove('c');
is($pq->size(), 1, 'remove nonexistent');
$pq->remove('a');
is($pq->size(), 0, 'remove last');

$pq = Array::Heap::ModifiablePriorityQueue->new();
$pq->add_unordered('a', 1);
$pq->add_unordered('b', 2);
$pq->add_unordered('c', 3);
$pq->add_unordered('d', 4);
is($pq->size(), 4, 'add unordered');
$pq->add_unordered('b', 0);
is($pq->size(), 4, 'modify unordered');
$pq->remove_unordered('e');
is($pq->size(), 4, 'remove nonexistent');
$pq->remove_unordered('c');
is($pq->size(), 3, 'remove');
$pq->remove_unordered('d');
is($pq->size(), 2, 'remove last');
$pq->restore_order();
is($pq->get(), 'b', 'get modified');
is($pq->get(), 'a', 'get last');
is($pq->size(), 0, 'empty');

