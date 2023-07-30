<script>
	import PageTitle from '$lib/components/Layout/PageTitle.svelte';
	let taskInput = '';

	export let data;

	let kanbanEl;

	let startDragEl;

	$: console.log(startDragEl);

	import { dndzone } from 'svelte-dnd-action';
</script>

<PageTitle pageTitle="Kanban" pageDesc="ayo" />

<section>
	<input bind:value={taskInput} type="text" placeholder="enter a task. ex: cleaning dishes" />

	<div bind:this={kanbanEl} class="kanban">
		{#each data.columns as column}
			{@const cards = data.cards.filter((c) => c.column === column.id)}
			<div class="kanban__col">
				<h3 class="kanban__type">{column.label}</h3>
				{#if cards.length > 0}
					{#each cards as card}
						<article class="task">
							<p class="task__title">{card.title}</p>
						</article>
					{/each}
				{:else}
					<p>No Tasks</p>
				{/if}
			</div>
		{/each}
	</div>
</section>

<style>
	.task {
		width: 200px;
		border: 1px solid black;
		margin-bottom: var(--space5);
		border-radius: var(--borderRadiusSM);
		padding: var(--space2) var(--space3);
		overflow-y: auto;
	}

	.task__title {
		display: flex;
		white-space: normal;
		width: 100%;
		word-break: normal;
	}

	.kanban__col {
		border: 1px solid green;
		padding: var(--space5) var(--space7);
		height: fit-content;
		border-radius: var(--borderRadius);
		width: 300px;
	}
	.kanban__type {
		margin-bottom: var(--space6);
	}

	.kanban {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		gap: var(--space8);
	}

	.tabs {
		margin-bottom: var(--space6);
	}
</style>
