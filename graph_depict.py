import networkx as nx
import matplotlib.pyplot as plt

class depict:
    def __init__(self,out):
        self.ans=out

    def breakdown(self,item):
        action = 0
        source_name = ""
        source_items = []
        source_item = ""
        for c in item:
            if c == '[':
                action = 1
                continue
            elif c == ']':
                break
            elif c == ',':
                source_items.append(source_item)
            elif c == '\'':
                continue
            if action == 0:
                source_name += str(c)
            else:
                source_item += str(c)

        return {'name': source_name,'items': source_items}

    def print_res(self):
        plt.figure(figsize=(7,7))
        print('\n\nOrdering Graph\n\n')
        G=nx.DiGraph()
        relations=[]
        for eg in self.ans.OrderingGraph.edges:
            link = []
            source_node = []
            sink_node = []
            components=self.breakdown(str(eg.source))
           # print("source: ",components['name']," source_items: ",components['items'])
            #source_node[components['name']]=components['items']
            source_node.append(components['name'])
            for item in components['items']:
                source_node.append(item)
            #node = {components['name']:components['items']}
            components=self.breakdown(str(eg.sink))
            #print("sink: ", components['name'], " sink_items: ", components['items'])
            #node = {components['name']: components['items']}
            #sink_node[components['name']] = components['items']
            sink_node.append(components['name'])
            for item in components['items']:
                sink_node.append(item)
            link=link+[source_node]
            link=link+[sink_node]
            #link=[source_node,sink_node]
            #link.append(source_node)
            #link.append(sink_node)
            relations=relations+[link]
            print(link)
            print(str(source_node))
            G.add_edge(str(source_node),str(sink_node),color='r')

        print(relations)
        print('\n\nCausal Graph\n\n')
        relations=[]
        for eg in self.ans.CausalLinkGraph.edges:
            link = []
            source_node = []
            sink_node = []
            components=self.breakdown(str(eg.source))
           # print("source: ",components['name']," source_items: ",components['items'])
            #source_node[components['name']]=components['items']
            source_node.append(components['name'])
            for item in components['items']:
                source_node.append(item)
            #node = {components['name']:components['items']}
            components=self.breakdown(str(eg.sink))
            #print("sink: ", components['name'], " sink_items: ", components['items'])
            #node = {components['name']: components['items']}
            #sink_node[components['name']] = components['items']
            sink_node.append(components['name'])
            for item in components['items']:
                sink_node.append(item)
            link=link+[source_node]
            link=link+[sink_node]
            relations=relations+[link]
            print(link)
            G.add_edge(str(source_node),str(sink_node),color='b')
        print(relations)
        pos = nx.circular_layout(G)
        edges = G.edges()
        colors = [G[u][v]['color'] for u,v in edges]
        #weights = [G[u][v]['weight'] for u,v in edges]

        nx.draw(G, pos, edges=edges, edge_color=colors,with_labels=True,font_size=6)
        #plt.figure(figsize=(10,10))
        plt.savefig("depiction.png")
