/**
 * @generated SignedSource<<444e7d44dec770db28b966dc36dd72a7>>
 * @lightSyntaxTransform
 * @nogrep
 */

/* tslint:disable */
/* eslint-disable */
// @ts-nocheck

import { ConcreteRequest, Query } from 'relay-runtime';
export type indexPageQuery$variables = {};
export type indexPageQuery$data = {
  readonly repository: {
    readonly description: string | null;
    readonly name: string;
    readonly owner: {
      readonly login: string;
    };
  } | null;
};
export type indexPageQuery = {
  response: indexPageQuery$data;
  variables: indexPageQuery$variables;
};

const node: ConcreteRequest = (function(){
var v0 = [
  {
    "kind": "Literal",
    "name": "name",
    "value": "0maru"
  },
  {
    "kind": "Literal",
    "name": "owner",
    "value": "0maru"
  }
],
v1 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "name",
  "storageKey": null
},
v2 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "description",
  "storageKey": null
},
v3 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "login",
  "storageKey": null
},
v4 = {
  "alias": null,
  "args": null,
  "kind": "ScalarField",
  "name": "id",
  "storageKey": null
};
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "indexPageQuery",
    "selections": [
      {
        "alias": null,
        "args": (v0/*: any*/),
        "concreteType": "Repository",
        "kind": "LinkedField",
        "name": "repository",
        "plural": false,
        "selections": [
          (v1/*: any*/),
          (v2/*: any*/),
          {
            "alias": null,
            "args": null,
            "concreteType": null,
            "kind": "LinkedField",
            "name": "owner",
            "plural": false,
            "selections": [
              (v3/*: any*/)
            ],
            "storageKey": null
          }
        ],
        "storageKey": "repository(name:\"0maru\",owner:\"0maru\")"
      }
    ],
    "type": "Query",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "indexPageQuery",
    "selections": [
      {
        "alias": null,
        "args": (v0/*: any*/),
        "concreteType": "Repository",
        "kind": "LinkedField",
        "name": "repository",
        "plural": false,
        "selections": [
          (v1/*: any*/),
          (v2/*: any*/),
          {
            "alias": null,
            "args": null,
            "concreteType": null,
            "kind": "LinkedField",
            "name": "owner",
            "plural": false,
            "selections": [
              {
                "alias": null,
                "args": null,
                "kind": "ScalarField",
                "name": "__typename",
                "storageKey": null
              },
              (v3/*: any*/),
              (v4/*: any*/)
            ],
            "storageKey": null
          },
          (v4/*: any*/)
        ],
        "storageKey": "repository(name:\"0maru\",owner:\"0maru\")"
      }
    ]
  },
  "params": {
    "cacheID": "ca6ce6748f1012bdb59d9ceb8aea6168",
    "id": null,
    "metadata": {},
    "name": "indexPageQuery",
    "operationKind": "query",
    "text": "query indexPageQuery {\n  repository(owner: \"0maru\", name: \"0maru\") {\n    name\n    description\n    owner {\n      __typename\n      login\n      id\n    }\n    id\n  }\n}\n"
  }
};
})();

(node as any).hash = "f5f63f37387b1ceec8a15b7d09d0f8f7";

export default node;
