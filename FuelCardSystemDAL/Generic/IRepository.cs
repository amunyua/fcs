using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity.Core.Objects;
using System.Linq.Expressions;

namespace FuelCardSystemDAL
{
    public interface IRepository<T> : IDisposable where T : class
    {
        /// <summary>
        /// Retrieve an object that can be queried on
        /// </summary>
        /// <returns>An instance of <see cref="IQueryable"/> of type T</returns>
        IQueryable<T> Fetch();

        /// <summary>
        /// Retrieves an IEnumerable collection of type T
        /// </summary>
        /// <returns>An instance of <see cref="IEnumerable"/> of type T</returns>
        IEnumerable<T> GetAll();

        /// <summary>
        /// Find an IEnumerable collection of type T that satisfies the predicate
        /// </summary>
        /// <returns>An instance of <see cref="IEnumerable"/> of type T</returns>
        IEnumerable<T> Find(Func<T, bool> predicate);

        /// <summary>
        /// Retrieve a single object of type T matching the predicate
        /// </summary>
        /// <returns>An instance of <see cref="IEnumerable"/> of type T</returns>
        T Single(Func<T, bool> predicate);

        /// <summary>
        /// Retrieve the first object of type T matching the predicate
        /// </summary>
        /// <returns>An instance of <see cref="IEnumerable"/> of type T</returns>
        T First(Func<T, bool> predicate);

        /// <summary>
        /// Adds an object of type T
        /// </summary>
        /// <param name="entity">Instance of type T</param>
        void Add(T entity);

        /// <summary>
        /// Deletes an object of type T
        /// </summary>
        /// <param name="entity">Instance of type T</param>
        void Delete(T entity);

        /// <summary>
        /// Attaches an object of type T
        /// </summary>
        /// <param name="entity">Instance of type T</param>
        void Attach(T entity);

        /// <summary>
        /// update the changes that have been made to the repository
        /// </summary>
        void Update(T entityToUpdate);

        /// <summary>
        /// Saves the changes that have been made to the repository
        /// </summary>
        int SaveChanges();

        /// <summary>
        /// Saves the changes that have been made to the repository with the passed parameters
        /// </summary>
        /// <param name="options">Parameters to change the behavior</param>
        //void SaveChanges(SaveOptions options);
    }
}