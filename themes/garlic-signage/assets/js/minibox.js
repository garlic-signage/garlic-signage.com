document.addEventListener("DOMContentLoaded", function()
{
	var layer = document.createElement("div")
	layer.innerHTML="<button>close ✖</button>";
	layer.style.cssText = "position:fixed;text-align:center;top:0;left:0;z-index:99999; width:100%; height:100%; background: #000 none 50% 50% no-repeat;opacity:0.98;display:none;padding-top:1em;"
	document.body.appendChild(layer)
	layer.onclick = function() { layer.style.display = "none" }
	var boxes = document.getElementsByClassName("minibox")
	for(var i=0; i<boxes.length; ++i) boxes[i].addEventListener("click", function(e)
	{
		let img = new Image();
		img.onload = function()
		{
			layer.style.backgroundSize = (window.innerWidth < this.width ? "contain" : "auto");
		}
		img.src = e.target.parentNode.href;
		window.addEventListener("resize", function ()
		{
			layer.style.backgroundSize = (window.innerWidth < img.width ? "contain" : "auto");
		});
		e.preventDefault()
		layer.style.backgroundImage = "url('"+img.src+"')"
		layer.style.display = "block"
	})
})
