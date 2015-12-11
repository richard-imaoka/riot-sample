<htmltag onclick={f}>
    <div style={"text-indent: " + 10*this.currentNestLevel + "px;"}>
        &lt{opts.data.tagName}<span each={opts.data.attributes}>{attributeName}="{attributeValue}"</span>&gt
    </div>
    <div if={opts.data.value}>
    </div>
    <div each={child, i in enrichChildren(opts.data.children)}>
        <htmltag data={child}></htmltag>
    </div>
    <div  style={"text-indent: " + 10*(this.currentNestLevel+1) + "px;"} if={this.opts.data.value}>
        {this.opts.data.value}
    </div>
    <div style={"text-indent: " + 10*this.currentNestLevel + "px;"}>
        &lt/{opts.data.tagName}&gt
    </div>

    <style>
        span {
            border-style: solid;
            border-width: 1px
        }

        div {
            border-style: solid;
            border-width: 1px
        }
    </style>
    <script>
        this.currentNestLevel = this.opts.data.currentNestLevel ? this.opts.data.currentNestLevel : 0
        console.log(this.currentNestLevel)
        this.nthChild = 1;
//        f(e) {
//            this.opts.data.children.push({"tagName": "span", "value": "dummy"});
//        }

        enrichChildren (children) {
            enrichedChildren = []
            for(var i in children )
                enrichedChildren.push( this.enrichChild( children[i], i ) )

            return enrichedChildren
        }

        enrichChild(child, index){
            enrichedChild = {}
            for (var attrname in child)
                enrichedChild[attrname] = child[attrname]

            enrichedChild["currentNestLevel"] = this.currentNestLevel + 1
            enrichedChild["nthChild"] = index

            return enrichedChild
        }

    </script>
</htmltag>