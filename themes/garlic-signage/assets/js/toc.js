document.addEventListener("DOMContentLoaded", function ()
{
	let headers             = [].slice.call(document.body.querySelectorAll("h1, h2, h3"));
	let toc_container= document.getElementById("toc");
	let MyTableOfContents= new TableOfContents(headers, toc_container);
	MyTableOfContents.create();
});

class TableOfContents
{
	COLLAPSED     = "►";
	ELAPSED       = "▼";
	headers        = [];
	h3_class_name = "";
	class_name    = ""
	toc_container        = null;

	constructor(headers, toc_container)
	{
		this.headers = headers;
		this.toc_container = toc_container;
	}

	create(toc_container)
	{
		let toc_list = document.createElement("ul");
		for (let i = 0; i < this.headers.length; i++)
		{
			this.determineId(i);
			this.determineClassName(i);
			toc_list.appendChild(this.createChild(i));
		}
		this.toc_container.appendChild(toc_list);
		this.toc_container.style.display = "block";

		this.setEvents();
	}

	determineClassName(pos)
	{
		this.class_name = "";
		if (pos + 1 < this.headers.length && this.headers[pos].localName === "h2" && this.headers[pos + 1].localName === "h3")
			this.class_name = "allow_to_elapse";

		if (this.headers[pos].localName === "h2")
			this.h3_class_name = "h3_toc_" + this.headers[pos].id;

		else if (this.headers[pos].localName === "h3")
			this.class_name = this.h3_class_name;
	}

	determineId(pos)
	{
		this.headers[pos].id =  (this.headers[pos].id !== "") ? this.headers[pos].id : "h" + pos;
	}

	createChild(pos)
	{
		let toc_list_item = document.createElement("li");
		toc_list_item.id = "toc_" + this.headers[pos].id;
		toc_list_item.setAttribute('class', this.headers[pos].tagName.toLowerCase());
		if (this.class_name !== "")
			toc_list_item.classList.add(this.class_name);

		if (this.class_name === "allow_to_elapse")
			toc_list_item.setAttribute("before-content", this.COLLAPSED);

		toc_list_item.appendChild(this.createLink(pos));

		if (this.headers[pos].tagName.toLowerCase() === "h3")
			toc_list_item.style.display = "none";
		return toc_list_item;
	}

	createLink(pos)
	{
		let toc_entry = document.createElement("a");
		toc_entry.setAttribute("href","#"+this.headers[pos].id);
		toc_entry.innerText = this.headers[pos].innerText;

		return toc_entry;
	}

	setEvents()
	{
		let allow_to_elapse = document.getElementsByClassName("allow_to_elapse");
		for (let i = 0; i < allow_to_elapse.length; i++)
		{
			allow_to_elapse[i].addEventListener('click',   (evt) =>
			{
				this.toggleHandler(allow_to_elapse[i]);
				this.toggleVisibility(evt.currentTarget.getAttribute("id"));
			})
		}
	}

	toggleVisibility(h3_classes)
	{
		let affected = document.getElementsByClassName("h3_" + h3_classes)
		for (let j = 0; j < affected.length; j++)
		{
			if (affected[j].style.display === "none")
				affected[j].style.display = "block";
			else
				affected[j].style.display = "none";
		}
	}

	toggleHandler(h2_element)
	{
		if (h2_element.getAttribute("before-content") === this.COLLAPSED)
			h2_element.setAttribute("before-content", this.ELAPSED);
		else
			h2_element.setAttribute("before-content", this.COLLAPSED);
	}
}