#include<bits/stdc++.h>
using namespace std;
int32_t isqrt(int32_t num) {
    assert(("sqrt input should be non-negative", num > 0));
    int32_t res = 0;
    int32_t bit = 1 << 30; // The second-to-top bit is set.
                           // Same as ((unsigned) INT32_MAX + 1) / 2.

    // "bit" starts at the highest power of four <= the argument.
    while (bit > num)
        bit >>= 2;

    while (bit != 0) {
        if (num >= res + bit) {
            num -= res + bit;
            res = (res >> 1) + bit;
        } else
            res >>= 1;
        bit >>= 2;
    }
    return res;
}
int main()
{
    cout << isqrt(200);
}