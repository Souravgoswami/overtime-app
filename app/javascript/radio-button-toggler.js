$(() => {
	var radios = Array.from(document.getElementsByClassName('radio-button-toggler'))

	for(let i of radios) {
		i.state = false

		i.onclick = () => {
			i.checked = i.state = !i.state

			for(let j of radios)
				if(j !== i) j.state = false
		}
	}
})
