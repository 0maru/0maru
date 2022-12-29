import { graphql } from 'relay-runtime';

export default graphql`
    query IssueQuery($owner: String!, $name: String!, $number: Int!) {
        repository(owner: $owner, name: $name) {
            issue(number: $number) {
                id
                bodyText
                author {
                    login
                }
            }
        }
    }
`