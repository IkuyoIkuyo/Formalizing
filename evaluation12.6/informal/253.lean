**Informal proof:**
Let me prove that y = z in a ring R where xy = 1 and zx = 1.

1) First, we start with the given equations:
   * We have xy = 1 (hypothesis h1)
   * We have zx = 1 (hypothesis h2)

2) Let's multiply the equation xy = 1 on the left by z:
   * z(xy) = z1
   * (zx)y = y (using associativity of multiplication)
   * 1y = y (using h2: zx = 1)
   * y = y

3) Now, let's multiply the equation zx = 1 on the right by y:
   * (zx)y = 1y
   * z(xy) = y (using associativity of multiplication)
   * z1 = y (using h1: xy = 1)
   * z = y

4) Therefore, y = z

The key insight in this proof is that when we have a left inverse (z) and a right inverse (y) for an element x in a ring, these inverses must be equal. The proof uses basic ring properties like associativity of multiplication and the fact that 1 is the multiplicative identity.