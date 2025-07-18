<script lang="ts">
  import { fly } from 'svelte/transition';
  let answered = false;
  let answer = '';
  let animating = false;

  function askFrog() {
    animating = true;
    answer = '';
    setTimeout(() => {
      answer = Math.random() > 0.5 ? 'Yes, you are a frog! 🐸' : 'No, you are not a frog! 🙅‍♂️';
      answered = true;
      animating = false;
    }, 1200);
  }
</script>

<main style="display: flex; flex-direction: column; align-items: center; justify-content: center; min-height: 80vh;">
  <h1>Am I a frog?</h1>
  <button on:click={askFrog} disabled={animating} style="padding: 1em 2em; font-size: 1.2em; margin: 1em; cursor: pointer; border-radius: 8px; border: none; background: #8fd694; color: #222; transition: background 0.2s;">
    {#if !animating}
      Ask
    {:else}
      <span style="display: inline-block; animation: bounce 0.6s infinite alternate;">🐸</span>
    {/if}
  </button>
  {#if answered}
    <div transition:fly={{ y: 40, duration: 500 }}>{answer}</div>
  {/if}

  <!-- Tip Menu -->
  <div style="margin-top: 2em; padding: 1.5em; background: #f7f7f7; border-radius: 12px; box-shadow: 0 2px 8px #0001; min-width: 260px; max-width: 90vw; display: flex; flex-direction: column; align-items: center;">
    <h2 style="margin-bottom: 0.5em; font-size: 1.1em; color: #3a3a3a;">Enjoyed this? Leave a tip!</h2>
    <button on:click={() => window.location.href = 'https://coff.ee/drphil5043'} style="padding: 0.7em 2em; border-radius: 6px; border: none; background: #ffd966; color: #222; font-weight: bold; font-size: 1.1em; cursor: pointer; transition: background 0.2s;">Tip @ coff.ee/drphil5043</button>
  </div>
</main>

<style>
  @keyframes bounce {
    0% { transform: translateY(0); }
    100% { transform: translateY(-16px); }
  }
</style>
