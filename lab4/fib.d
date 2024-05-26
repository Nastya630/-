import std.stdio;
import std.algorithm : map;
import std.range : iota, take;

int[] fibonacci(int n) {
    if (n <= 0) return [];
    if (n == 1) return [0];

    int[] fibs = [0, 1];
    fibs.length = n;
    for (int i = 2; i < n; i++) {
        fibs[i] = fibs[i-1] + fibs[i-2];
    }
    return fibs;
}

void main() {
    int x;
    readf(" %s",x);
    
    writeln("Первые ", x, " чисел Фибоначчи: ", fibonacci(x));
}
