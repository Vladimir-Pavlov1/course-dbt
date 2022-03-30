PART 1: Create new models to answer the first two questions (answer questions in README file)

What is our overall conversion rate?

62%

What is our conversion rate by product?

select name,
      round(count(distinct case 
        when is_checkout then session_id else null
        end)::numeric / count(distinct session_id) * 100, 2) as conversion_rate
from dbt_vladimir_p.fct_events

group by 1
order by 1 

Alocasia Polly
41.18
Aloe Vera
49.23
Angel Wings Begonia
39.34
Arrow Head
55.56
Bamboo
53.73
Bird of Paradise
45.00
Birds Nest Fern
42.31
Boston Fern
41.27
Cactus
54.55
Calathea Makoyana
50.94
Devil's Ivy
48.89
Dragon Tree
46.77
Ficus
42.65
Fiddle Leaf Fig
50.00
Jade Plant
47.83
Majesty Palm
49.25
Money Tree
46.43
Monstera
51.02
Orchid
45.33
Peace Lily
40.91
Philodendron
48.39
Pilea Peperomioides
47.46
Pink Anthurium
41.89
Ponytail Palm
40.00
Pothos
34.43
Rubber Plant
51.85
Snake Plant
39.73
Spider Plant
47.46
String of pearls
60.94
ZZ Plant
53.97

