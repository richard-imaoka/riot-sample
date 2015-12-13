<slide-up>
    <div class={cssClass} onclick={showNotShow}>Some content here....</div>
    <div class={cssClass} if={showIt} onclick={showNotShow}>Some content here....</div>

    <script>

        this.cssClass = "animated slideInUp"
        this.showIt = false

        showNotShow() {
            this.showIt = !this.showIt
        }
    </script>
    <style>
        slide-up div {
            width: 100%;
            height: 50%;
            position: fixed;
            top: 50%;
            background-color: rgba(255, 128, 32, 0.8);
            border-style: solid;
        }
    </style>
</slide-up>