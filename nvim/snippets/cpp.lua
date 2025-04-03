local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

return {
    s("main", {
        t({
            "#include <iostream>",
            "",
            "int main() {",
            "  ",
        }),
        i(0),
        t({ "", "  return 0;", "}" }),
    }),
    s("comp", {
        t({
            "#include <bits/extc++.h>",
            "#include <bits/stdc++.h>",
            "",
            "#define LSOne(S) ((S) & -(S))",
            "",
            "using namespace std;",
            "using namespace __gnu_pbds;",
            "",
            "typedef long long ll;",
            "typedef pair<int, int> ii;",
            "typedef vector<int> vi;",
            "typedef vector<ii> vii;",
            "typedef vector<ll> vll;",
            "typedef tree<ll, null_type, less<ll>, rb_tree_tag,",
            "             tree_order_statistics_node_update>",
            "    ost;",
            "",
            "// Shortcuts for \"common\" constants",
            "const int INF = 1e9;   // 10^9 = 1B is < 2^31-1",
            "const ll LLINF = 4e18; // 4*10^18 is < 2^63-1",
            "const double EPS = 1e-9;",
            "",
            "int main() {",
            "  ios_base::sync_with_stdio(false);",
            "  cin.tie(NULL);",
            "",
        }),
        i(0),
        t({
            "",
            "  return 0;",
            "}",
        }),
    }),
}
