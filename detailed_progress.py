from pyparsing import OneOrMore, nestedExpr

class detailed_progress:

    def process_domain(filename):
        #open domain file
        inputdata=""
        with open("./Ground_Compiler_Library/domains/propose_domain.pddl") as domain:
            for row in domain:
                inputdata=inputdata+row
        print(inputdata)
        #parse input data
        data = OneOrMore(nestedExpr()).parseString(inputdata)
        print(data)
        #process types info
        tool=1
        types={}
        objects=[]
        gather=0
        for word in data[0][2]:
            if word==":types":
                continue
            elif word=='-':
                gather=1
                continue
            if gather==1:
                #
                if word in types:
                    for item in objects:
                        types[word].append(item)
                else:
                    types[word]=[]
                    for item in objects:
                        types[word].append(item)
                objects=[]
                gather=0
            else:
                objects.append(word)
        print(types)
        parameters={}
        preconditions={}
        effects={}
        par=0
        pre=0
        eff=0
        #process action info
        for infos in data[0]:
            if infos[0]!=':action':
                continue
            for itr in infos:
                if itr==':parameters':
                    par=1
                    continue
                elif itr==':precondition':
                    pre=1
                    continue
                elif itr==':efects':
                    eff=1
                    continue
                if par==1:
                    for word in itr:



detailed_progress.process_domain("")
