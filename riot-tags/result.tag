<result>
    <iframe name="result" >
    </iframe>
    <script>
        this.observable = this.opts.observable
        console.log(this.observable)

        this.on("mount", function(){
            that = this
            this.observable.on("HTMLUpdate", function(HTMLString){
                console.log("IFRAAAAMEE", HTMLString)
                doc = that.result.contentDocument
                doc.open()
                doc.write(HTMLString)
                doc.close()
            })
        })

    </script>
</result>