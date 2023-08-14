<script>
	import { showSidebar, handleSidebar } from '$lib/stores/sidebarStore.js';

	import { page } from '$app/stores';

	let sidebarItems = [
		{
			name: 'Home',
			path: '/'
		},
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

<aside class:sidebar--show={$showSidebar} class="sidebar">
	<ul class="sidebar__list">
		{#each sidebarItems as sidebarItem}
			<li class="sidebar__item" class:active-page={$page.url.pathname === `${sidebarItem.path}`}>
				<a on:click={handleSidebar} class="sidebar__link textBody" href={sidebarItem.path}
					>{sidebarItem.name}
				</a>
			</li>
		{/each}
	</ul>
</aside>

<style>
	.sidebar {
		display: flex;
		position: fixed;
		transition: 0.1s linear;
		width: 0;
		overflow: hidden;
		z-index: 99;
	}

	.sidebar--show {
		width: 100vw;
		background-color: var(--colorBgLayout);
	}

	.sidebar__list {
		width: 100%;
		margin: 0;
		position: relative;
	}

	.sidebar__item {
		background: black;
		border-bottom: 1px solid var(--colorBgLayout);
		color: var(--colorBgLayout);
	}

	.active-page {
		background-color: var(--colorPrimary);
		color: black;
	}

	.sidebar__link {
		width: 100%;
		padding: var(--space6) var(--space5);
		display: block;
	}
</style>
