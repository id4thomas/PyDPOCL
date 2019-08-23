A Partial Order Causal-Link (POCL) Planner implemented with Python 3. POCL is a search through plan-space where each child node in the search resolves some flaw of its parent node. Program terminates when 'k' leaves are found with no flaws. Each operator from the domain is preprocessed with the problem atoms into ground steps.

--David Winer drwiner@cs.utah.edu


POCL Planner modified to generate story that includes conflict between characters. When handling flaw the planner checks whether flaw is caused by the same character. If flaw is caused by the same character promote (add edges sink -> threat) & demote (add edges threat -> source) plan as normal. If flaw is between characters ignore the flan and expand plan (add edges source -> threat, threat -> sink).

--Youngrok Song id2thomas@gmail.com
