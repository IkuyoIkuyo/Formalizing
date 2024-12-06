**Informal proof:**
Let me provide a step-by-step proof:

1) First, let's note that since φ is an automorphism, φ(P) is also a subgroup of G.

2) Since P is a p-Sylow subgroup, |P| = pⁿ where n is the highest power of p that divides |G|.

3) For any automorphism φ, we know that |φ(P)| = |P| (automorphisms preserve order).
   Therefore, |φ(P)| = pⁿ.

4) Now, φ(P) is also a p-subgroup of G (since its order is a power of p).

5) Since P is normal in G (given by hypothesis), we know that P is the unique p-Sylow subgroup of G.
   (This follows from Sylow's theorems: if a p-Sylow subgroup is normal, it's unique)

6) Therefore, φ(P) being a p-subgroup with order pⁿ must equal P, as P is the unique p-Sylow subgroup.

Thus, we have proved that φ(P) = P for every automorphism φ of G.

The key insight in this proof is that the normality of P makes it the unique p-Sylow subgroup, and any automorphism must map P to another p-Sylow subgroup (which must be P itself due to uniqueness).