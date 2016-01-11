/**
 * Created by nishyu on 1/11/2016.
 */
<html-editor>
  <div name="aaa" class={theClass} style="font-size: 30px;">
    <div style="background-color: rgba(255, 128, 32, 1);" onclick={closeEditor}>
      <span style="text-align: center; border-bottom-style: solid;">
        <i class="fa fa-angle-double-down" style="display: inline-block; width: 100%;"></i>
      </span>
    </div>
    <div>&ltbody&gt</div>
    <form>
      <select style="font-size: 30px;" onBlur="" onChange="">
        <option>Hello World</option>
        <option>Hello Brother</option>
      </select>
    </form>
    <div>&lt/body&gt</div>
  </div>

  <script>
    this.theClass = "animated slideInUp editor"

    closeEditor(){
      this.theClass = "animated slideOutDown editor"
    }

    opts.store.on('close_editor_behavior', function(){

    })

  </script>

  <style>
    div.editor {
      width: 100%;
      height: 60%;
      position: fixed;
      top: 40%;
      left: 0px;
      background-color: rgba(255, 128, 32, 0.95);
      animation-duration: 0.5s;
      animation-delay: 0.1s;
    }
  </style>

</html-editor>