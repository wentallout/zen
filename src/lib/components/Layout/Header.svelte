<script>
	import { showSidebar } from '$lib/stores/sidebarStore';
	import List from '~icons/ph/list';

	function handleSidebar() {
		showSidebar.update((show) => !show);
	}
</script>

<header class="sidebar">
	<button class="sidebar__btn" on:click={handleSidebar}>
		<List width="32" height="32" />
	</button>
	<a href="/">
		<div class="logo">Zen Garden</div>
	</a>
</header>

<style>
	.sidebar {
		width: 100%;
		display: flex;
		flex-direction: row;
		height: 80px;
		align-items: center;
		padding: 0 var(--space5);
		background-color: black;
		color: white;
		gap: var(--space4);
		position: sticky;
		top: 0;
		z-index: 99;
	}

	.sidebar__btn {
		background-color: transparent;
		color: var(--colorBgLayout);
		cursor: pointer;
	}

	.logo {
		font-family: var(--fontFancy);
		font-size: var(--fontSizeHeading5);
	}
</style>
