<script>
	import CaretLeft from '~icons/ph/caret-left';
	import { page } from '$app/stores';
	import { showSidebar } from '$lib/stores/sidebarStore';
	let sidebarEl;

	let sidebarItems = [
		{
			name: 'Password Generator',
			path: '/passgen'
		},
		{
			name: 'Kanban',
			path: '/kanban'
		},
		{
			name: 'Weather Forecast',
			path: '/weather'
		}
	];
</script>

<aside class:sidebar--show={$showSidebar} class="sidebar" bind:this={sidebarEl}>
	<ul class="sidebar__list">
		{#each sidebarItems as sidebarItem}
			<li class="sidebar__item" class:active-page={$page.url.pathname === `${sidebarItem.path}`}>
				<a class="sidebar__link" href={sidebarItem.path}>{sidebarItem.name} </a>
			</li>
		{/each}
	</ul>
</aside>

<style>
	.sidebar {
		display: none;
		border: 1px solid black;
		color: black;
		position: fixed;
		top: 80px;
		left: -1000px;
		min-height: 100vh;
		z-index: 2;
		background-color: var(--colorBgLayout);
	}

	.sidebar--show {
		display: block;
		left: 0;
	}

	@media (min-width: 768px) {
		.sidebar {
			position: initial;
			display: flex;
			width: fit-content;
		}
	}

	.sidebar__link {
		display: block;
		width: 100%;
	}

	.active-page {
		background-color: var(--colorPrimary);
		color: black;
	}

	.sidebar__list {
		width: 100%;
		margin: 0;
	}

	.sidebar__item {
		width: 100%;
		border-bottom: 1px solid black;
	}

	.sidebar__link {
		padding: var(--space2) var(--space5);
		display: block;
	}
</style>
