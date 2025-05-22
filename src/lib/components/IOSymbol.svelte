<script lang="ts">
   import { Handle, Position, type NodeProps } from "@xyflow/svelte";
   let text = $state("");
   let rows = $derived.by(() => {
      const matches = text.match(/\n/g); // Finds all \n
      console.log(matches?.length);

      return matches ? matches.length + 1 : 1;
   });
   const { data, id, selected }: NodeProps = $props();
</script>

<div class="group">
   <svg
      width="100"
      height="60"
      viewBox="0 0 100 60"
      fill="none"
      class="text-base-200 text-sm flex justify-center items-center stroke-2 {selected
         ? 'stroke-emerald-700'
         : 'stroke-transparent hover:stroke-zinc-600'} transition-all group"
   >
      <path
         d="M10.8352 0L100 0L89.1649 60L0 60L10.8352 0Z"
         fill="currentcolor"
         fill-rule="evenodd"
      />
   </svg>
   <textarea
      bind:value={text}
      class="text-center outline-none resize-none text-gray-300 absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 h-auto"
      {rows}
   >
   </textarea>
   <Handle
      id="process-a"
      type="source"
      position={Position.Top}
      class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
   />
   <Handle
      id="process-b"
      type="source"
      position={Position.Bottom}
      class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
   />
   <Handle
      id="process-c"
      type="source"
      position={Position.Left}
      class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
   />
   <Handle
      id="process-d"
      type="source"
      position={Position.Right}
      class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
   />
</div>
