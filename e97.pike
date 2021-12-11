
int main() {
    array(int) digits = ({3, 3, 4, 8, 2, 0, 0, 0, 0, 0});

    
    for (int n = 0; n < 7830457; ++n) {
        int carry = 0;
        for (int i = 0; i < 10; ++i) {
            int prod = (digits[i] * 2) + carry;
            carry = prod / 10;
            digits[i] = prod % 10;
        }
    }
    digits[0]++;
    for (int i = 9; i >= 0; --i) {
        Stdio.stdout->printf("%d", digits[i]);
    }
    Stdio.stdout->printf("\n");
}
