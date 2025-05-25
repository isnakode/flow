<script lang="ts">
    import { Handle, Position, type NodeProps } from "@xyflow/svelte";
    let text = $state("");
    let rows = $derived.by(() => {
        const matches = text.match(/\n/g); 
        return matches ? matches.length + 1 : 1;
    });
    const { data, id, selected }: NodeProps = $props();
</script>

<div class="group">
    <svg
        viewBox="0 0 62 62"
        class="text-base-200 text-sm flex justify-center items-center stroke-2 size-24 group"
    >
        <path
            d="M 1 51 L 1 11 C 1 5.48 14.43 1 31 1 C 47.57 1 61 5.48 61 11 L 61 51 C 61 56.52 47.57 61 31 61 C 14.43 61 1 56.52 1 51 Z"
            fill="currentColor"
            class={selected
                ? "stroke-emerald-700"
                : "group-hover:stroke-zinc-600 stroke-zinc-700"}
            stroke-width="1"
        />
        <path
            d="M 1 11 C 1 16.52 14.43 21 31 21 C 47.57 21 61 16.52 61 11"
            fill="currentColor"
            class={selected
                ? "stroke-emerald-700"
                : "group-hover:stroke-zinc-600 stroke-zinc-700"}
            stroke-width="1"
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
