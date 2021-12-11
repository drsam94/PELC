// Solution to project euler 50 using C++ template metaprogramming
// All computation is done at compile time other than a call to have a simple
// way of accessing the answer.
// Has issues running at the correct scale of the input
#include<stdio.h>

// Helper to have a definitely constexpr max function that also doesn't
// produce millions of warnings because of comparing different anonymous enums
// and having two different enumerations as the branches of a ?:
#define ENUM_MAX(a, b) \
    static_cast<int>(a) > static_cast<int>(b) ? \
    static_cast<int>(a) : static_cast<int>(b)

// Basic is_prime function through templates
template <int p, int i, bool tooBig>
class is_prime {
public:
    enum { prim = ( (p % i) && is_prime<p, i + 1, (i * i > p)>::prim) };
};

template<int p, int i>
class is_prime<p, i, true> {
public:
    enum { prim = 1 };
};

template<int i, bool b>
class is_prime<2, i, b> {
public:
    enum { prim = 1 };
};

// helper, returns p if prime, 0 otherwise
template<int p>
class prime_or_not {
public:
    enum { prim = is_prime<p, 2, false>::prim ? p : 0 };
};

// returns the sum of all primes between low and low + len - 1
template<int low, int len>
class prime_chain {
public:
    enum { value = prime_or_not<low>::prim + prime_chain<low + 1, len - 1>::value };
    enum { realLen = bool(prime_or_not<low>::prim) + prime_chain<low + 1, len - 1>::realLen };
};

template<int low>
class prime_chain<low, 0> {
public:
        enum { value = 0 };
        enum { realLen = 0 };
};

// prime prime chain returns the sum of the prime chain starting at low with
// length len. However, it has two other special return values
// 1: the prime chain sum is not prime
// 0: the prime chain sum exceeds maximum
// These two return values are used in terminated_max to dtrt
template<int low, int len, int maximum>
class prime_prime_chain {
public:
    enum { value = prime_or_not<prime_chain<low, len>::value>::prim > maximum ? 0 :
                   1 + prime_or_not<prime_chain<low, len>::value>::prim };
    enum { realLen = prime_chain<low, len>::realLen };
};

template<int base, int len, int maximum>
class best_chain;

// terminated_max helps us build up a max to get the best chain, and
// terminates computation once the first paremeter reaches 0.
template<int val, int b, int l, int m>
class terminated_max {
public:
    using pc = prime_prime_chain<b, l, m>;
    using bc = best_chain<b, 1 + l, m>;

    enum { value = pc::value == 1 ? bc::value : (
                   static_cast<int>(pc::realLen) > static_cast<int>(bc::realLen) ?
                   static_cast<int>(pc::value)   : static_cast<int>(bc::value)) };

    enum { realLen = pc::value == 1 ? bc::realLen : ENUM_MAX((pc::realLen), (bc::realLen)) };
};

template<int b, int l, int m>
class terminated_max<0, b, l, m> {
public:
    enum { value = 0 };
    enum { realLen = 0 };
};

template<int base, int len, int maximum>
class best_chain {
public:
    enum { value = terminated_max<prime_prime_chain<base, len, maximum>::value, base, len, maximum>::value };

    enum { realLen = terminated_max<prime_prime_chain<base, len, maximum>::value, base, len, maximum>::realLen };
};

// We want the termination condition of finding the answer to be
// base = max; in order to accomplish this we pass parameters in a wrapper class
// and check for their equality
template<int value>
class valueWrapper {
public:
    enum { val = value };
};

template<typename baseVal, typename maxVal>
class the_answer {
public:
    using current_best = best_chain<baseVal::val, 1, maxVal::val>;
    using next_answer  = the_answer<valueWrapper<baseVal::val + 1>, maxVal>;
    enum { ans = static_cast<int>(current_best::realLen) > static_cast<int>(next_answer::len) ?
                     static_cast<int>(current_best::value - 1) : static_cast<int>(next_answer::ans) };
    enum { len = ENUM_MAX((current_best::realLen), (next_answer::len)) };
};

template<typename maxVal>
class the_answer<maxVal, maxVal> {
public:
    enum { ans = 0 };
    enum { len = 0 };
};

int main(int argc, char **argv) {
    // g++4.9 actually segfaults (rather than yielding any useful error...) when
    // trying to run this with a maximum above ~2k. However, as the logic
    // seems sound, it yields the correct answer for bounds until it breaks,
    // and template metaprogramming is ridiculous and super dependent on the
    // compiler (though you could imagine righting a more efficient interpreter
    // for the "language"), I am going to claim a moral victory here
    printf("%d\n", the_answer<valueWrapper<2>, valueWrapper<1000000>>::ans);
    return 0;
}
