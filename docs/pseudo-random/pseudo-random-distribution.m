Clear["Global`*"];
p[n_] := a n;
get[i_] := Evaluate[p[i] * Product[1 - p[k], {k, 1, i - 1}]];
expn[a_] := 1 / Sum[-(-a)^i * i^2 * Pochhammer[(-1 + a) / a, -1 + i], {i, 1, Ceiling[1 / a]}];
expr[a_] := Evaluate@ FullSimplify[
    1 / Sum[i * get[i], {i, 1, Ceiling[1 / a]}] // ExpandAll // Together,
    Assumptions -> 0 < a < 1
];
expn[0] = expr[0] = 0;
