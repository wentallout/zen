<script>
	export let projectTitle;

	export let isTabSelected = false;
</script>

<button class:active={isTabSelected} class="tab__btn" type="button" on:click>
	{projectTitle}
</button>

<style>
	.tab__btn {
		background-color: transparent;
		border: 0;

		border-top-left-radius: var(--borderRadiusSM);
		border-top-right-radius: var(--borderRadiusSM);
		outline: 1px solid black;
	}

	.active {
		background-color: red;
	}
</style>
