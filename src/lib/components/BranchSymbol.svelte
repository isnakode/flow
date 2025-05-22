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
        viewBox="0 0 100 100"
        width="100"
        height="100"
        xmlns="http://www.w3.org/2000/svg"
        class="text-base-200 text-sm"
    >
        <polygon
            points="50,0 100,50 50,100 0,50"
            fill="currentcolor"
            class="stroke-2 {selected
                ? 'stroke-emerald-700'
                : 'stroke-transparent hover:stroke-zinc-600'} transition-all group"
        />
    </svg>

    <textarea
        bind:value={text}
        class="text-center outline-none resize-none text-gray-300 absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 h-auto"
        {rows}
    >
    </textarea>
    <Handle
        id="branch-a"
        type="source"
        position={Position.Top}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
    <Handle
        id="branch-b"
        type="source"
        position={Position.Bottom}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
    <Handle
        id="branch-c"
        type="source"
        position={Position.Left}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
    <Handle
        id="branch-d"
        type="source"
        position={Position.Right}
        class="bg-transparent! size-2! border-none! rounded-full! group-hover:bg-gray-400! transition-all"
    />
</div>
