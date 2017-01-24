using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity.Core.Objects;
using System.Linq.Expressions;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Core.Objects.DataClasses;
using FuelCardSystemEntities.Models;
using System.Data.Entity.Infrastructure;

namespace FuelCardSystemDAL
{
    /// <summary>
    /// A generic repository for working with data in the database
    /// </summary>
    /// <typeparam name="T">A POCO that represents an Entity Framework entity</typeparam>
    public class Repository<T> : IRepository<T> where T : class
    {
        /// <summary>
        /// The context object for the database
        /// </summary>
        //protected ECEntities context;
        internal FuelCardSystemEntities.Models.FuelCardDBEntities context;
        internal DbSet<T> dbSet;
        

        /// <summary>
        /// Initializes a new instance of the Repository class
        /// </summary>
        public Repository()
            : this(new FuelCardSystemEntities.Models.FuelCardDBEntities())
        {

        }

        /// <summary>
        /// Initializes a new instance of the Repository class
        /// </summary>
        /// <param name="context">The Entity Framework ObjectContext</param>
        public Repository(FuelCardSystemEntities.Models.FuelCardDBEntities context)
        {
            this.context = context;
            dbSet = this.context.Set<T>();

            ((IObjectContextAdapter)context).ObjectContext.CommandTimeout = 900;
        }

        /// <summary>
        /// Gets all records as an IQueryable
        /// </summary>
        /// <returns>An IQueryable object containing the results of the query</returns>
        public IQueryable<T> Fetch()
        {
            return dbSet;
        }

        /// <summary>
        /// Gets all records as an IEnumberable
        /// </summary>
        /// <returns>An IEnumberable object containing the results of the query</returns>
        public IEnumerable<T> GetAll()
        {
            return this.Fetch().AsEnumerable();
        }

        /// <summary>
        /// Finds a record with the specified criteria
        /// </summary>
        /// <param name="predicate">Criteria to match on</param>
        /// <returns>A collection containing the results of the query</returns>
        public IEnumerable<T> Find(Func<T, bool> predicate)
        {
            return dbSet.Where<T>(predicate);
        }

        /// <summary>
        /// Gets a single record by the specified criteria (usually the unique identifier)
        /// </summary>
        /// <param name="predicate">Criteria to match on</param>
        /// <returns>A single record that matches the specified criteria</returns>
        public T Single(Func<T, bool> predicate)
        {
            return dbSet.SingleOrDefault<T>(predicate);
        }

        /// <summary>
        /// The first record matching the specified criteria
        /// </summary>
        /// <param name="predicate">Criteria to match on</param>
        /// <returns>A single record containing the first record matching the specified criteria</returns>
        public T First(Func<T, bool> predicate)
        {
            return dbSet.FirstOrDefault<T>(predicate);
        }

        /// <summary>
        /// Deletes the specified entity
        /// </summary>
        /// <param name="entity">Entity to delete</param>
        /// <exception cref="ArgumentNullException"> if <paramref name="entity"/> is null</exception>
        public void Delete(T entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }

            //dbSet.DeleteObject(entity);
            DeleteObject(entity);
        }


        public void DeleteObject(T entityToDelete)
        {
            if (context.Entry(entityToDelete).State == EntityState.Detached)
            {
                dbSet.Attach(entityToDelete);
            }
            dbSet.Remove(entityToDelete);
        }
        /// <summary>
        /// Adds the specified entity
        /// </summary>
        /// <param name="entity">Entity to add</param>
        /// <exception cref="ArgumentNullException"> if <paramref name="entity"/> is null</exception>
        public void Add(T entity)
        {
            if (entity == null)
            {
                throw new ArgumentNullException("entity");
            }

            dbSet.Add(entity);
        }

        /// <summary>
        /// Attaches the specified entity
        /// </summary>
        /// <param name="entity">Entity to attach</param>
        public void Attach(T entity)
        {
            dbSet.Attach(entity);
        }

        /// <summary>
        /// Saves all context changes
        /// </summary>
        public int SaveChanges()
        {
            return context.SaveChanges();
        }

        public void Update(T entityToUpdate)
        {
            dbSet.Attach(entityToUpdate);
            context.Entry(entityToUpdate).State = EntityState.Modified;
        }

        /// <summary>
        /// Saves all context changes with the specified SaveOptions
        /// </summary>
        /// <param name="options">Options for saving the context</param>
        //public void SaveChanges(SaveOptions options)
        //{
        //    context.DetectChanges();
        //    context.SaveChanges(options);
        //}

        /// <summary>
        /// Releases all resources used by the WarrantManagement.DataExtract.Dal.ReportDataBase
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Releases all resources used by the WarrantManagement.DataExtract.Dal.ReportDataBase
        /// </summary>
        /// <param name="disposing">A boolean value indicating whether or not to dispose managed resources</param>
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (context != null)
                {
                    context.Dispose();
                    context = null;
                }
            }
        }

        internal void Delete(bool p)
        {
            throw new NotImplementedException();
        }
    }
}