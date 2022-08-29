# metasort

This is a collection of *compile-time* sorting implementations with C++
[template metaprogramming](https://en.wikipedia.org/wiki/Template_metaprogramming).

Currently, the following sorting algorithms are implemented:

- [Quicksort](https://en.wikipedia.org/wiki/Quicksort)
- [Mergesort](https://en.wikipedia.org/wiki/Merge_sort)

All the implementation details can be found in [`metasort.h`](metasort.h).

## Examples

The metasort algorithms work on an integer sequence template,
named `metasort::sequence`. Its use is analogous to
[`std::integer_sequence`](https://en.cppreference.com/w/cpp/utility/integer_sequence).

The following illustrates how sorting can be performed on a sequence.

```c++
using seq_original = metasort::sequence<int, 5, 7, 4, 2, 8, 6, 1, 9, 0, 3>;
using seq_quicksort = metasort::quicksort::sort_t<seq_original>;
```

In this example, we create a sequence of `int`s, and perform quicksort on the
sequence. The results are computed and stored into `seq_quicksort` during
compilation. To verify that this works:

```c++
static_assert(
        std::is_same_v<seq_quicksort,
                       metasort::sequence<int, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9>>,
        "quicksort assertion failed");
```

If the result `seq_quicksort` is not sorted, the `static_assert` assertion
would have failed during compilation.

The `metasort::sequence` type also comes with several helper templates. For
instance, the `metasort::get` template gets the value at a specified index. The
type also provides a `to_array()` member function, which turns the sequence
into an `std::array` for ease of further manipulation.

See [example.cc](example.cc) for a full example.

## License

Copyright (c) 2022 Zhong Ruoyu. Licensed under the [MIT License](LICENSE).
