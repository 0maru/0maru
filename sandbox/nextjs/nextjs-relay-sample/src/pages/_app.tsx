import 'src/styles/globals.css'
import type { AppProps } from 'next/app'
import { loadQuery, RelayEnvironmentProvider } from 'react-relay'
import { Suspense } from 'react'
import { createEnvironment } from '../lib/relayEnvironment'
import indexPageQueryGraphql from '../queries/__generated__/indexPageQuery.graphql'

const preloadedQuery = loadQuery(createEnvironment, indexPageQueryGraphql, {})

function MyApp({Component, pageProps} : AppProps) {
  return (
    <RelayEnvironmentProvider environment={createEnvironment}>
      <Suspense fallback={'Loading...'}>
        <Component
          preloadedQuery={preloadedQuery}
          {...pageProps} />
      </Suspense>
    </RelayEnvironmentProvider>
  )
}

export default MyApp
