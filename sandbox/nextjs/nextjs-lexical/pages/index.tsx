import { InitialConfigType, LexicalComposer } from '@lexical/react/LexicalComposer';
import { PlainTextPlugin } from '@lexical/react/LexicalPlainTextPlugin';
import { ContentEditable } from '@lexical/react/LexicalContentEditable';
import LexicalErrorBoundary from '@lexical/react/LexicalErrorBoundary';
import { $getRoot, $getSelection, LexicalEditor } from 'lexical';
import { HistoryPlugin } from '@lexical/react/LexicalHistoryPlugin';
import { MarkdownShortcutPlugin } from '@lexical/react/LexicalMarkdownShortcutPlugin';
import { HeadingNode, QuoteNode } from '@lexical/rich-text';
import ToolbarPlugin from '../plugins/toolbarPlugin';
import { RichTextPlugin } from '@lexical/react/LexicalRichTextPlugin';
import { ListPlugin } from '@lexical/react/LexicalListPlugin';
import { LinkPlugin } from '@lexical/react/LexicalLinkPlugin';
import { AutoLinkPlugin } from '@lexical/react/LexicalAutoLinkPlugin';

const theme = {
    ltr: "ltr",
    rtl: "rtl",
    placeholder: "editor-placeholder",
    paragraph: "editor-paragraph",
    quote: "editor-quote",
    heading: {
        h1: "editor-heading-h1",
        h2: "editor-heading-h2",
        h3: "editor-heading-h3",
        h4: "editor-heading-h4",
        h5: "editor-heading-h5"
    },
    list: {
        nested: {
            listitem: "editor-nested-listitem"
        },
        ol: "editor-list-ol",
        ul: "editor-list-ul",
        listitem: "editor-listitem"
    },
    image: "editor-image",
    link: "editor-link",
    text: {
        bold: "editor-text-bold",
        italic: "editor-text-italic",
        overflowed: "editor-text-overflowed",
        hashtag: "editor-text-hashtag",
        underline: "editor-text-underline",
        strikethrough: "editor-text-strikethrough",
        underlineStrikethrough: "editor-text-underlineStrikethrough",
        code: "editor-text-code"
    },
    code: "editor-code",
    codeHighlight: {
        atrule: "editor-tokenAttr",
        attr: "editor-tokenAttr",
        boolean: "editor-tokenProperty",
        builtin: "editor-tokenSelector",
        cdata: "editor-tokenComment",
        char: "editor-tokenSelector",
        class: "editor-tokenFunction",
        "class-name": "editor-tokenFunction",
        comment: "editor-tokenComment",
        constant: "editor-tokenProperty",
        deleted: "editor-tokenProperty",
        doctype: "editor-tokenComment",
        entity: "editor-tokenOperator",
        function: "editor-tokenFunction",
        important: "editor-tokenVariable",
        inserted: "editor-tokenSelector",
        keyword: "editor-tokenAttr",
        namespace: "editor-tokenVariable",
        number: "editor-tokenProperty",
        operator: "editor-tokenOperator",
        prolog: "editor-tokenComment",
        property: "editor-tokenProperty",
        punctuation: "editor-tokenPunctuation",
        regex: "editor-tokenVariable",
        selector: "editor-tokenSelector",
        string: "editor-tokenSelector",
        symbol: "editor-tokenProperty",
        tag: "editor-tokenProperty",
        url: "editor-tokenOperator",
        variable: "editor-tokenVariable"
    }
}


function onError(error: Error, editor: LexicalEditor) {
    console.log(error, editor)
}

function onChange(editorState: any) {
    editorState.read(() => {
        const root = $getRoot();
        const selection = $getSelection();

        console.log(root, selection);
    });
}

const editorConfig: InitialConfigType = {
    namespace: 'MyEditor',
    theme,
    onError,
    nodes: [
        HeadingNode,
        QuoteNode,
    ]
}

export default function Home() {
    return (
        <div>
            <p>inedx</p>
            <Editor/>
        </div>
    )
}


const Editor = () => {
    return (
        <LexicalComposer initialConfig={editorConfig}>
            <div className="editor-container">
                <ToolbarPlugin/>
                <div className="editor-inner">
                    <RichTextPlugin
                        contentEditable={<ContentEditable className="editor-input"/>}
                        placeholder={<p>placeholder</p>}
                        ErrorBoundary={LexicalErrorBoundary}
                    />
                </div>
            </div>
        </LexicalComposer>
    )
}