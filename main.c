extern void uart_puts(char *s);

int puts(char *s) {
	uart_puts(s);
}

void main() {
    int i = 0;
    puts("Hello, world from C\n\r");
    while(1) {
        i++;
	if ((i % 4) == 0) puts("0\n\r");
	if ((i % 4) == 1) puts("1\n\r");
	if ((i % 4) == 2) puts("2\n\r");
	if ((i % 4) >= 3) puts("3\n\r");
    }
}
