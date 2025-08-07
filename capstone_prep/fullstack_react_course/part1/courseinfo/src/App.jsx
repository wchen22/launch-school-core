const Header = (props) => {
  return (
    <h1>{props.course.name}</h1>
  )
}

const Content = (props) => {
  return (
    <>
      {
        props.parts.map((part, index) => (
          <p key={index}>{part.name} {part.exercises}</p>
        ))
      }
    </>
  )
}

const Total = (props) => {
  return (
    <p>Number of exercises: {
      props.parts.reduce((acc, part) => acc + part.exercises, 0)
    }</p>
  )

}

const App = () => {
const course = {
    name: 'Half Stack application development',
    parts: [
      {
        name: 'Fundamentals of React',
        exercises: 10
      },
      {
        name: 'Using props to pass data',
        exercises: 7
      },
      {
        name: 'State of a component',
        exercises: 14
      }
    ]
  }

  return (
    <div>
      <Header course={course} />
      <Content parts={course.parts}/>
      <Total parts={course.parts}/>
    </div>
  )
}

// const App = () => {
//   const course = 'Half Stack application development'
//   const part1 = 'Fundamentals of React'
//   const exercises1 = 10
//   const part2 = 'Using props to pass data'
//   const exercises2 = 7
//   const part3 = 'State of a component'
//   const exercises3 = 14

//   const parts= [
//     { part: part1, exercises: exercises1 },
//     { part: part2, exercises: exercises2 },
//     { part: part3, exercises: exercises3 }
//   ]

//   return (
//     <div>
//       <Header course={course} />
//       <Content parts={parts} />
//       <Total exercises={[exercises1, exercises2, exercises3]}/>
//     </div>
//   )
// }

export default App
