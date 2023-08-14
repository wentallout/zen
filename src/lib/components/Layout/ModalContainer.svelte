<script>
	export let showModal;

	let dialogEl;

	$: if (dialogEl && showModal) dialogEl.showModal();
</script>

<!-- svelte-ignore a11y-click-events-have-key-events a11y-no-noninteractive-element-interactions -->
<dialog
	bind:this={dialogEl}
	on:close={() => (showModal = false)}
	on:click|self={() => dialogEl.close()}>
	<!-- svelte-ignore a11y-no-static-element-interactions -->
	<div on:click|stopPropagation>
		<h4 class="modal__header">
			<slot name="header" />
		</h4>

		<slot />
		<!-- svelte-ignore a11y-autofocus -->
		<button class="btn" autofocus on:click={() => dialogEl.close()}>Close</button>
	</div>
</dialog>

<style>
	.modal__header {
		margin-bottom: var(--space6);
	}

	.btn {
		width: 100%;
	}

	dialog {
		margin: auto;
		min-width: 300px;
		border: none;
		padding: var(--space4) var(--space6);
	}

	dialog[open] {
		animation: zoom 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
	}
	@keyframes zoom {
		from {
			transform: scale(0.8);
		}
		to {
			transform: scale(1);
		}
	}

	dialog::backdrop {
		background: rgba(0, 0, 0, 0.3);
	}
	dialog[open]::backdrop {
		animation: fade 0.2s ease-out;
	}
	@keyframes fade {
		from {
			opacity: 0;
		}
		to {
			opacity: 1;
		}
	}
</style>
