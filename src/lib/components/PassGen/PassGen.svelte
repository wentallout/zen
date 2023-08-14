<script>
	import ModalContainer from '$lib/components/Layout/ModalContainer.svelte';
	import Copy from '~icons/ph/copy';

	import GearSix from '~icons/ph/gear-six';

	function getRandomLower() {
		return String.fromCharCode(Math.floor(Math.random() * 26) + 97);
	}

	function getRandomUpper() {
		return String.fromCharCode(Math.floor(Math.random() * 26) + 65);
	}

	function getRandomNumber() {
		return String.fromCharCode(Math.floor(Math.random() * 10) + 48);
	}

	function getRandomSymbol() {
		const symbols = '!@#$%^&*';
		return symbols[Math.floor(Math.random() * symbols.length)];
	}

	let randomFunc = {
		lower: getRandomLower,
		upper: getRandomUpper,
		numbers: getRandomNumber,
		symbols: getRandomSymbol
	};

	let uppercaseChecked = true;
	let lowercaseChecked = true;
	let numbersChecked = true;
	let symbolsChecked = true;
	let passLength = 10;

	let resultPass = '';

	function handlePassGen() {
		resultPass = generateNewPass(
			uppercaseChecked,
			lowercaseChecked,
			numbersChecked,
			symbolsChecked,
			passLength
		);
	}

	function generateNewPass(upper, lower, numbers, symbols, length) {
		let generatedPassword = '';
		const typesCount = upper + lower + numbers + symbols;

		const typesArr = [{ upper }, { lower }, { numbers }, { symbols }].filter(
			(item) => Object.values(item)[0]
		);

		if (typesCount === 0) {
			return '';
		}

		for (let i = 0; i < length; i += typesCount) {
			typesArr.forEach((type) => {
				const funcName = Object.keys(type)[0];

				generatedPassword += randomFunc[funcName]();
			});
		}

		const finalPassword = generatedPassword.slice(0, length);

		return finalPassword;
	}

	function handleCopy() {
		const password = resultPass;

		if (!password) {
			return;
		}
		let textarea = document.createElement('textarea');
		textarea.value = password;
		document.body.appendChild(textarea);
		textarea.select();
		document.execCommand('copy');
		textarea.remove();
		alert('Password copied');
	}

	let showModal = false;
</script>

<section>
	<div class="passgen">
		<div class="result">
			<p class="result__text">{resultPass}</p>
			<button
				class:hidden={!resultPass}
				on:click={handleCopy}
				class="btn result__copy"
				id="clipboard">
				<Copy width="16" height="16" />
			</button>
		</div>

		<div class="btn-container">
			<button on:click={handlePassGen} class="btn passgen__btn textBody">
				Generate Random Password
			</button>
			<button on:click={() => (showModal = true)} class="btn btn--secondary">
				<GearSix />
			</button>
		</div>

		<ModalContainer bind:showModal>
			<span slot="header">Password Settings</span>
			<div class="setting">
				<div class="setting__item">
					<label for="length">Length</label>
					<input type="number" bind:value={passLength} id="length" min="4" max="20" />
				</div>
				<div class="setting__item">
					<label for="uppercase">Include uppercase letter</label>
					<input id="uppercase" type="checkbox" bind:checked={uppercaseChecked} />
				</div>
				<div class="setting__item">
					<label for="lowercase">Include lowercase letter</label>
					<input id="lowercase" type="checkbox" bind:checked={lowercaseChecked} />
				</div>
				<div class="setting__item">
					<label for="numbers">Include numbers</label>
					<input id="numbers" type="checkbox" bind:checked={numbersChecked} />
				</div>

				<div class="setting__item">
					<label for="symbols">Include symbols</label>
					<input id="symbols" type="checkbox" bind:checked={symbolsChecked} />
				</div>
			</div>
		</ModalContainer>
	</div>
</section>

<style>
	.passgen {
		width: 100%;
		border: 1px solid var(--colorText);
		overflow: hidden;
		border-radius: var(--borderRadius);
	}

	.passgen__btn {
		background-color: var(--colorPrimary);
		flex-grow: 1;
	}

	.passgen__btn:hover {
		background-color: var(--colorPrimaryHover);
	}

	.btn-container {
		display: flex;
		flex-direction: row;
		flex-wrap: wrap;
		width: 100%;
	}

	.result {
		display: flex;
		flex-direction: row;
		justify-content: space-between;

		position: relative;
		height: 80px;
	}

	.result__text {
		font-family: monospace;
		word-break: break-all;
		width: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.result__copy {
		position: absolute;
		right: 0;
	}

	.setting {
		display: flex;
		flex-direction: column;
		gap: var(--space6);
		margin-bottom: var(--space8);
	}

	.setting__item {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
		padding: var(--space2) 0;
	}
</style>
