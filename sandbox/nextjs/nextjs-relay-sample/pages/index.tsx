import type { NextPage } from 'next'
import { useEffect, useState } from 'react'
import fetchGraphQL from '../lib/fetchGraphql'


const Home : NextPage = () => {
  const [name, setName] = useState(null)

  useEffect(() => {
    let mounted = true
    fetchGraphQL(`
      query RepositoryNameQuery {
        repository(owner: "0maru", name: "0maru") {
          name
        }
      }
    `).then((response : any) => {
      if (!mounted) {
        return
      }
      const data = response.data
      setName(data.repository.name)
    }).catch((e : any) => {
      console.error(e)
    })

    return () => {
      mounted = false
    }
  }, [])

  return (
    <div>
      <p>
        {name != null ? `Repository: ${name}` : 'Loading'}
      </p>
    </div>
  )
}

export default Home
