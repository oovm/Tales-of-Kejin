(* ::Package:: *)

(* ::Section:: *)
(*\:786c\:4fdd\:5e95\:5236*)


Clear["Global`*"];


Sum[i * a (1 - a)^(i - 1), {i, 1, Ceiling[1 / a]}] // FullSimplify
1 / Sum[i * a (1 - a)^(i - 1), {i, 1, k}] /. k -> 1 / a
Plot[-(p / (-1 + 2 (1 - p)^(1 / p))), {p, 0, 1}]


(* ::Section:: *)
(*\:5ef6\:8fdf\:4fdd\:5e95\:5236*)


Clear["Global`*"];


p1[0] = p2[0] = p3[0] = 0;
p1[i_] := 2 / 100;
p2[i_] := Which[i <= 1421, i * 0.0007036249045568989` , i == 1422, 1, True, 0]
p3[i_] := Which[i <= 50, 2 / 100, i <= 100, (i - 50) / 50, True, 0]
q1 = Table[p1[i] * Product[1 - p1[k - 1], {k, 2, i}] // N, {i, 0, 100}];
q2 = Table[p2[i] * Product[1 - p2[k - 1], {k, 2, i}] // N, {i, 0, 100}];
q3 = Table[p3[i] * Product[1 - p3[k - 1], {k, 2, i}] // N, {i, 0, 100}];
ListLinePlot[
    Transpose@{Range[1, 100], Rest@#}& /@ {q1, q2, q3},
    PlotLegends -> {"\:539f\:59cb\:6982\:7387\:6a21\:578b", "\:4f2a\:968f\:673a\:6a21\:578b", "\:4fdd\:5e95\:4fee\:6b63\:6a21\:578b"},
    PlotLabel -> Text@"\:5f53\:524d\:6982\:7387"
]
ListLinePlot[
    Transpose@{Range[0, 100], # // Accumulate}& /@ {q1, q2, q3},
    PlotLegends -> {"\:539f\:59cb\:6982\:7387\:6a21\:578b", "\:4f2a\:968f\:673a\:6a21\:578b", "\:4fdd\:5e95\:4fee\:6b63\:6a21\:578b"},
    PlotLabel -> Text@"\:7d2f\:8ba1\:6982\:7387"
]
