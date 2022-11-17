import { graphql } from 'relay-runtime'

export default graphql`
    query indexPageQuery {
        repository(owner: "0maru", name: "0maru") {
            name,
            description,,
            owner {
                login,
            }
        }
    }
`