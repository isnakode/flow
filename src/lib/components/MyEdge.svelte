<script lang="ts">
   import { browser } from "$app/environment";
   import type { EdgeProps } from "@xyflow/svelte";
   import {
      BaseEdge,
      EdgeLabel,
      getSmoothStepPath,
      useOnSelectionChange,
      useSvelteFlow,
   } from "@xyflow/svelte";
   const { updateEdge } = useSvelteFlow();
   let selectedMyself = $state(false);

   const {
      id,
      sourceX,
      sourceY,
      targetX,
      targetY,
      label,
      sourcePosition,
      targetPosition,
   }: EdgeProps = $props();
   const [edgePath, x, y] = $derived(
      getSmoothStepPath({
         sourceX,
         sourceY,
         targetX,
         targetY,
         sourcePosition,
         targetPosition,
      }),
   );
   useOnSelectionChange(({ edges, nodes }) => {
      if (edges.length == 1 && edges[0].id == id && nodes.length == 0) {
         if (browser) {
            (document.activeElement as HTMLElement).blur();
         }
         selectedMyself = true;
      } else {
         selectedMyself = false;
      }
   });
   let rows = $derived.by(() => {
      const matches = (label ?? "").match(/\n/g); // Finds all \n
      return matches ? matches.length + 1 : 1;
   });
</script>

<BaseEdge path={edgePath} class="stroke-2! m-0! p-0! size-fit!" />

<EdgeLabel transparent class=" text-lg" {x} {y}
   >{#if selectedMyself}
      <!-- svelte-ignore a11y_autofocus -->
      <textarea
         autocomplete="off"
         autofocus={true}
         onfocus={(e) => e.currentTarget.select()}
         {rows}
         oninput={(e) => {
            updateEdge(id, { label: e.currentTarget.value });
         }}
         class="outline-none resize-none h-auto text-center">{label}</textarea
      >
   {:else}
      <button
         onclick={() => (selectedMyself = true)}
         class="bg-[#303030] {label ? 'p-1' : 'p-0'}"
      >
         <pre class="font-[inherit]">{label}</pre>
      </button>
   {/if}
</EdgeLabel>
