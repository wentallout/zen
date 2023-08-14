<script>
	async function getRandomWord() {
		const response = await fetch('https://random-word-api.herokuapp.com/word?lang=en');

		if (response.ok) {
			const data = await response.json();
			return data[0];
		} else {
			throw new Error('Failed to fetch data.');
		}
	}

	let finalResult;
	let isLoading = false;

	async function handleGenPassphrase() {
		isLoading = true;
		try {
			const [word1, word2] = await Promise.all([getRandomWord(), getRandomWord()]);

			const capitalizeFirstLetter = (word) => word.charAt(0).toUpperCase() + word.slice(1);

			finalResult = `${capitalizeFirstLetter(word1)}${capitalizeFirstLetter(word2)}`;
		} catch (error) {
			console.error(error);
			finalResult = 'Error occurred.';
		} finally {
			isLoading = false;
		}
	}

	function handleCopy() {
		let textarea = document.createElement('textarea');
		const password = finalResult;

		if (!password) {
			return;
		}

		textarea.value = password;
		document.body.appendChild(textarea);
		textarea.select();
		document.execCommand('copy');
		textarea.remove();
		alert('Password copied');
	}
	import Copy from '~icons/ph/copy';
</script>

<section>
	<div class="passgen">
		<div class="result">
			{#if isLoading}
				<p>Generating...</p>
			{:else if finalResult}
				{finalResult}

				<button class="btn result__copy" on:click={handleCopy}>
					<Copy width="16" height="16" />
				</button>
			{:else}
				<p />
			{/if}
		</div>
		<button class="btn passgen__btn" on:click={handleGenPassphrase}>
			<p>Generate Passphrase</p>
		</button>
	</div>
</section>

<style>
	.passgen {
		width: 100%;
		border: 1px solid var(--colorText);
		border-radius: var(--borderRadius);
		overflow: hidden;
	}

	.passgen__btn {
		width: 100%;
		background-color: var(--colorPrimary);
	}

	.result__copy {
		position: absolute;
		top: 0;
		right: 0;
	}

	.result {
		position: relative;

		height: 80px;
		padding: var(--space4) var(--space6);
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>
