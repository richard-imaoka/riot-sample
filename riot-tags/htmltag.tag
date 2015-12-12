<htmltag onclick={triggerHTMLUpdate}>
    <div style={"text-indent: " + 10*this.currentNestLevel + "px;"}>
        &lt{opts.data.tagName}<span each={this.attributes}>{attributeName}="{attributeValue}"</span>&gt
    </div>
    <div each={child, i in enrichChildren(this.children)}>
        <htmltag data={child}></htmltag>
    </div>
    <div style={"text-indent: " + 10*(this.currentNestLevel+1) + "px;"} if={this.opts.data.value}>
        {this.opts.data.value}
    </div>
    <div style={"text-indent: " + 10*this.currentNestLevel + "px;"}>
        &lt/{opts.data.tagName}&gt
    </div>

    <!--<button onclick={()=>alert(this.toHTMLString())}>+</button>-->

    <style>
        span {
            border-style: solid;
            border-width: 1px
        }
        div {
            font-family: monospace;
            font-size: 30px;
            border-style: solid;
            border-width: 1px
        }
    </style>

    <script>
        this.currentNestLevel = this.opts.data.currentNestLevel ? this.opts.data.currentNestLevel : 0
        this.nthChild = this.opts.data.nthChild ? this.opts.data.nthChild : 0;
        this.tagName  = this.opts.data.tagName
        this.children = this.opts.data.children
        this.attributes = this.opts.data.attributes
        this.value = this.opts.data.value
        this.observable = this.opts.data.observable

        enrichChildren(children)
        {
            enrichedChildren = []
            for (var i in children)
                enrichedChildren.push(this.enrichChild(children[i], i))

            return enrichedChildren
        }

        enrichChild(child, index)
        {
            enrichedChild = {}
            for (var attrname in child)
                enrichedChild[attrname] = child[attrname]

            enrichedChild["currentNestLevel"] = this.currentNestLevel + 1
            enrichedChild["nthChild"] = index
            enrichedChild["observable"] = this.observable

            return enrichedChild
        }

        toHTMLString(){
            return this._toHTMLStringInner(this)
        }

        _toHTMLStringInner(node)
        {
            str = "<" + node.tagName

            for( var i in node.attributes )
                str += " " + node.attributes[i].attributeName + '="' + node.attributes[i].attributeValue + '"'

            str += ">"

            for( var i in node.children )
                str += "\n" + this._toHTMLStringInner(node.children[i])

            if(node.value)
              str += "\n" + node.value

            str += "\n"
            str += "</" + node.tagName + ">"

            return str
        }

        triggerHTMLUpdate(){
            if(this.currentNestLevel===0)
                this.observable.trigger("HTMLUpdate", this.toHTMLString())
        }

        this.on("updated", this.triggerHTMLUpdate)


    </script>
</htmltag>