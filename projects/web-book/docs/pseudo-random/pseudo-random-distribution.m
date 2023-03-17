Clear["Global`*"];
p[n_] := a n;
get[i_] := Evaluate[p[i] * Product[1 - p[k], {k, 1, i - 1}]];
expn[a_] := 1 / Sum[-(-a)^i * i^2 * Pochhammer[(-1 + a) / a, -1 + i], {i, 1, Ceiling[1 / a]}];
expr[a_] := Evaluate@ FullSimplify[
    1 / Sum[i * get[i], {i, 1, Ceiling[1 / a]}] // ExpandAll // Together,
    Assumptions -> 0 < a < 1
];
expn[0] = expr[0] = 0;





Simplify`TrigToRealRadicals;
f1 = System`TrigToRadicalsDump`cos[2Pi / 360];
f2 = System`TrigToRadicalsDump`sin[2Pi / 360];
f3 = System`TrigToRadicalsDump`tan[2Pi / 360];
Clear[a1, a2, w1, w2]
rule = {
    1 + Sqrt[5] -> -4a2,
    1 - Sqrt[5] -> -4a1,
    5 - Sqrt[5] -> 4Sqrt[5]a1,
    -1 + I Sqrt[3] -> 2 w1,
    -1 - I Sqrt[3] -> 2 w2
};
FullSimplify[4f1 /. rule, Assumptions -> {w > 0}]
FullSimplify[4f2 /. rule, Assumptions -> {w > 0}]
FullSimplify[f3 /. rule, Assumptions -> {w > 0}]

a1 = (-1 + Sqrt[5]) / 4;
a2 = (-1 - Sqrt[5]) / 4;
w1 = (-1 + I Sqrt[3]) / 2;
w2 = (-1 - I Sqrt[3]) / 2;
{cos1, sin1, tan1x, tan1y} = {
    (I + 1) (I Sqrt[2] a2 (w1 w2^(1 / 3) + I w1^(1 / 3) w2) - 5^(1 / 4) Sqrt[a1] (w1 w2^(1 / 3) - I w1^(1 / 3) w2)) / 4,
    (I - 1) (I Sqrt[2] a2 (w1 w2^(1 / 3) - I w1^(1 / 3) w2) - 5^(1 / 4) Sqrt[a1] (w1 w2^(1 / 3) + I w1^(1 / 3) w2)) / 4,
    (5^(1 / 4) Sqrt[a1] (w1^(2 / 3) + I w2^(2 / 3)) - I Sqrt[2] a2 (w1^(2 / 3) - I w2^(2 / 3))),
    (5^(1 / 4) Sqrt[a1] (w1^(2 / 3) - I w2^(2 / 3)) - I Sqrt[2] a2 (w1^(2 / 3) + I w2^(2 / 3)))
};
cos1 - Cos[Pi / 180] // N // Chop
sin1 - Sin[Pi / 180] // N // Chop
I tan1x / tan1y - Tan[Pi / 180] // N // Chop

Clear[a1, a2, w1, w2]
FullSimplify[w1 w2^(1 / 3) + I w1^(1 / 3) w2 /. {w1 -> w, w2 -> w^2}, Assumptions -> {w > 0}]
FullSimplify[w1 w2^(1 / 3) - I w1^(1 / 3) w2 /. {w1 -> w, w2 -> w^2}, Assumptions -> {w > 0}]



With[
    {t = x / (1 - x^3)^(1 / 3)},
    (Log[1 + t] - (-1)^(1 / 3) Log[(-1)^(1 / 3) - t] + (-1)^(2 / 3) Log[(-1)^(2 / 3) + t]) / 3
]
D[%, x] // FullSimplify
