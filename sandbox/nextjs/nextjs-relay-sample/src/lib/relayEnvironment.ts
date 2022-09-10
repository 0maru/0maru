import { Environment, Network, RecordSource, Store } from 'relay-runtime'
import fetchGraphql from './fetchGraphql'

export const fetchRelay = (params : any, variables = {}) => {
  return fetchGraphql(params.text, variables)
}

export const createEnvironment = new Environment({
  network: Network.create(fetchRelay),
  store: new Store(new RecordSource()),
})


