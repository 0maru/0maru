import type { NextPage } from 'next'
import { Suspense, useEffect } from 'react'
import { PreloadedQuery, useClientQuery, usePreloadedQuery, useQueryLoader } from 'react-relay'
import indexPageQueryGraphql, {
  indexPageQuery
} from '../queries/__generated__/indexPageQuery.graphql'

const Index : NextPage = () => {
  const data = useClientQuery<indexPageQuery>(indexPageQueryGraphql, {})
  const [queryReference, loadQuery] = useQueryLoader<indexPageQuery>(indexPageQueryGraphql)

  useEffect(() => {
    loadQuery({})
  }, [])

  return (
    <div>
      <p>useClientQuery</p>
      <p>{data.repository?.name}</p>
      <p>{data.repository?.description}</p>
      <p>{data.repository?.owner.login}</p>
      <Suspense fallback={<p>loading...</p>}>
        {queryReference ? <Component queryReference={queryReference} /> : <p>loading</p>}
      </Suspense>
    </div>
  )
}

type Props = {
  queryReference : PreloadedQuery<indexPageQuery, Record<string, unknown>>
}
const Component = (props : Props) => {
  const data = usePreloadedQuery<indexPageQuery>(
    indexPageQueryGraphql,
    props.queryReference,
    {}
  )
  return (
    <>
      <p>usePreloadedQuery</p>
      <h1>{data.repository?.name}</h1>
      <h1>{data.repository?.description}</h1>
      <h1>{data.repository?.owner.login}</h1>
    </>
  )

}

export default Index
